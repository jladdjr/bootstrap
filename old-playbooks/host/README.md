# Deploying awx with minikube

## Minimum requirements

Playbooks were testing against RHEL 8.4.

If running on ec2 instance, need:

- t2.2xlarge (to ensure 8 processors, will fail if there are only 4)
- also, make sure to increase memory (50 GB will probably work);
  the default (10 GB) is not enough

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
