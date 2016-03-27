#!/bin/bash
#
# Functions for SlackBuilds

function git-pull {
	name=$1
	url=$2
	tag=$3

	# Clone/Pull latest
	if [ -d ./${name}/.git ]; then
	        cd ./${name}
		git checkout master
	        git pull
	        cd ..
	else
	        rm -rf ./${name}
	        git clone $url $name
	fi
	# Use a Git tag if specified
	cd ./${name}
	if [ ${tag} ]; then
		git checkout tags/${tag}
	fi
	cd ..
}

function source-from-archive {
	build_dir=$1
	file=$2
	url=$3

	# Download
	mkdir -v -p ${build_dir}/install ${build_dir} ${build_dir}/src
	if ! [ -f ${file} ]; then
	        wget -q ${url}
	fi
	# Extract
	tar -x -z -C ${build_dir}/src -f ./${file}
}

function stage {
	source_dir=$1
        build_dir=$2

	mkdir -v -p ${build_dir}/install ${build_dir}/src
	cp -v -f ./slack-desc ${build_dir}/install/slack-desc
        if [ -f ./doinst.sh ]; then
		cp -v -f ./doinst.sh ${build_dir}/install/doinst.sh
	fi
	cp -aRpf ${source_dir} ${build_dir}/src
}


function build {
	name=$1
	version=$2
	tag=$3
	build_dir=$4
	configure_opts=$5
	build_opts=$6

	# Compile
	cd ${build_dir}/src/*
	chown -Rc root:root .
	if [ -x ./bootstrap ]; then
		./bootstrap
	fi

	if [ "$(getconf LONG_BIT)" == "64" ]; then
	        lib_dir_suffix="64"
	else
	        lib_dir_suffix=""
	fi	
	./configure \
		--prefix=/usr/local \
		--libdir=/usr/local/lib${lib_dir_suffix} ${configure_opts}

	make install \
		-j$(getconf _NPROCESSORS_ONLN) \
		DESTDIR=${build_dir} \
		V=99
	cd ${build_dir} 
	rm -r -f ${build_dir}/src
	# Build package
	/sbin/makepkg -l y ${build_opts} -c n \
		/tmp/${name}-${version}-$(uname -m)-${tag}.txz
	rm -r -f ${build_dir}
}
