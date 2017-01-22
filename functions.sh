#!/bin/bash
#
# Functions for SlackBuilds

function log {
	echo "$(date) : $1 : $2"
}

function git-pull {
	name=$1
	build_dir=$2
	url=$3
	tag=$4

	log INFO $FUNCNAME
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
	mkdir -pv ${build_dir}/src
	cp -aRpf ./${name} ${build_dir}/src
}

function source-from-archive {
	name=$1
	build_dir=$2
	file=$3
	url=$4

	log INFO $FUNCNAME
	# Download
	mkdir -v -p ${build_dir}/install ${build_dir}/src
	if ! [ -f ${file} ]; then
	        wget -q ${url}
	fi
	# Extract
	tar -x -C $build_dir/src/${name} -f ./${file}
}

function stage {
	source_dir=$1
        build_dir=$2

	log INFO $FUNCNAME
	mkdir -v -p ${build_dir}/install ${build_dir}/src
	cp -v -f ./slack-desc ${build_dir}/install/slack-desc
        if [ -f ./doinst.sh ]; then
		cp -v -f ./doinst.sh ${build_dir}/install/doinst.sh
	fi
}


function build {
	name=$1
	build_dir=$2
	version=$3
	tag=$4
	configure_opts=$5
	build_opts=$6
	
	log INFO $FUNCNAME
	if [ "$(getconf LONG_BIT)" == "64" ]; then
	        lib_dir_suffix="64"
	else
	        lib_dir_suffix=""
	fi

	cd ${build_dir}/src/*
	chown -Rc root:root .
	if [ -x ./bootstrap ]; then
		./bootstrap
	elif [ -x ./bootstrap.sh ]; then
		./bootstrap.sh
	elif [ -x ./autogen.sh ]; then
		./autogen.sh
	fi

	if [ -x ./configure ]; then
		./configure \
			--prefix=/usr/local \
			--libdir=/usr/local/lib${lib_dir_suffix} ${configure_opts}
	fi
	make install \
		-j$(getconf _NPROCESSORS_ONLN) \
		DESTDIR=${build_dir} \
		V=99
	cd ${build_dir} 
	rm -r -f ${build_dir}/src
	/sbin/makepkg -l y ${build_opts} -c n \
			/tmp/${name}-${version}-$(uname -m)-${tag}.txz
	rm -r -f ${build_dir}
}
