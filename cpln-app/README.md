# cpln-app

This is a generic chart that can be used to deploy _most_ apps to Control Plane.

## Example

### Manifest

```yaml
# Chart.yaml
apiVersion: v2
name: app
description: My App
type: application
version: 0.1.0
appVersion: "1.2.3"
dependencies:
  - name: adeptmind-app
    version: "get from the chart"
    repository: "oci://us-central1-docker.pkg.dev/adeptmind-production-413020/helm-charts"
```

```yaml
# values.yaml
app:
  name: my-app
  image:
    repository: adeptmind/my-app
    tag: "v1.2.3"
```

### Usage

```bash
helm dependency build
helm template .
```
