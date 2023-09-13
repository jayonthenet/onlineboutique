# onlineboutique - HT style

This demo is based on https://github.com/GoogleCloudPlatform/microservices-demo so if you're looking for any code / code changes, you need to go there.

## Install
- Clone this repo :)
- If not yet done, create the application
  ```bash
  humctl create app onlineboutique
  ```
- Prepare the resource-definition for an in-cluster Redis
  ```bash
  humctl apply -f redis-cart-in-cluster.yaml
  ```
- Set variables to your liking in `deploy.sh` and `open.sh`
- Deploy using `deploy.sh` and observe in the UI how the services come alive
- Use `open.sh` to spawn a new browser window/tab to the right URL
