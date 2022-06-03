# swagger-ui

When the container hosting this code starts, it begins by executing the script `env.sh` that reads the environment and creates a new `env-config.js` file that in turn adds those environment variables to `window._env_`.  This allows the container to be built once and used in multiple different environments.

`env-defaults.txt` represents the list of environment variables that will be used by this application along with their default values if not overridden in the Kubernetes deployment

`env-config.js` represents the list of environment variables that will be used during local development only.  This file will be overwritten when the container starts.