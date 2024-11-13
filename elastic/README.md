## Elasticsearch Example

This example sets up a 3 replica Elasticsearch cluster, featuring the following configuration:

- Three-node Elasticsearch deployment
- A persistent storage of 10 GB per replica
- User authentication is disabled
- mTLS is enforced by default with Control Plane outside of Elastic configuration
- Deploy to AWS us-east-2 location

#### Requirements

- [Control Plane Account](https://controlplane.com)

### CLI

If you haven't already installed the Control Plane CLI, [click here](https://docs.controlplane.com/reference/cli) to do so.

#### Deploy Elasticsearch single-node setup

```bash
cpln helm install --gvc my-gvc  elasticsearch --org my-org
```

It will take a few minutes for elasticsearch to get to ready state.

#### Connect to Elasticsearch

The Elasticsearch instance we created can be accessed by any workload within your ORG. The connection between the client and server uses mTLS encryption. To test the connection to the database, run the following command from one of the workloads in your ORG:

```BASH
curl -u elastic:34f#@F43d2k87mbv43 http://elasticsearch.elasticsearch.cpln.local:9200
```


The Elasticsearch instances we created can be accessed by any workload within your **GVC**. The connection between the client and server uses mTLS encryption. To test the connection to the database, run the following command from one of the workloads in the GVC:

```BASH
# For loadbalanced request
curl http://elasticsearch.elasticsearch.cpln.local:9200

# For dedicated node
curl http://elasticsearch-0.elasticsearch:9200
curl http://elasticsearch-1.elasticsearch:9200
curl http://elasticsearch-2.elasticsearch:9200
```

### UI

#### Deploy Elasticsearch single-node setup

1. Create a GVC named `elasticsearch` and assign the location(s) that you would like to use.
2. Apply the `elasticsearch-cluster.yaml` file using the `cpln apply >_` option in the upper right corner. Ensure that the `locationLinks` match the GVC location(s) you selected before applying.

It will take a few minutes for Elasticsearch to get to ready state.

#### [Test Elasticsearch connectivity](#connect-to-elasticsearch-1)

### cleanup:

#### cli

```bash
cpln delete --gvc elasticsearch -f ./elasticsearch-cluster.yaml
```

Note: Running this command couple of times might be needed in order to properly clean up the Workloads and VolumeSets inside the GVC.

#### ui

1. delete the gvc `elasticsearch`. (You will need to clean up the Workloads and VolumeSets first)
1. delete the policy `elasticsearch-policy`.
1. delete the secrets `elasticsearch-config` and `elasticsearch-init`.
