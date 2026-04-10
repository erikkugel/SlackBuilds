// https://octokit.github.io/rest.js/v22/
import { Octokit } from "@octokit/rest";
import { createActionAuth } from "@octokit/auth-action";

const octokit = new Octokit({
    // https://github.com/octokit/auth-action.js
	authStrategy: createActionAuth,
    userAgent: 'Release Action v0.0.1',
});

// https://octokit.github.io/rest.js/v22/#actions
octokit.rest.repos.listReleases({
  owner: '',
  repo: '',
});