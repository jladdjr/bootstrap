# Deploying awx with minikube

## Tips and Tricks

### Viewing minikube dashboard

On the instance running minikube, run:

$ minikube dashboard --url

If minikube is running on a remote host, create a tunnel to the remote host:

$ ssh user@remotehost -L 34447:localhost:34447
(replace 34447 with the port shown by `minikube dashboard --url` if needed)

The minikube dashboard url is shown as a local address (127.0.0.1).
Since you created a tunnel and the dashboard url is being forwarded to your local
address, you can now access the dashboard url as it was first shown.
