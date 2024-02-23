# A deep dive into Kubernetes

---

## Andrew Pruski

<img src="images/apruski.jpg" style="float: right"/>

### Field Solutions Architect
#### Microsoft Data Platform MVP
#### Docker Captain
#### VMware vExpert

<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

### Session Aim
<!-- .slide: style="text-align: left;"> -->
<img src="images/down_the_rabbit_hole.gif" style="float: right"/>

To dive into Kubernetes to explore the various<br>
components and options for deploying<br>
applications

---

### Node Types
<!-- .slide: style="text-align: left;"> -->

Two different types of Kubernetes nodes: -<br>
- Control Nodes<br>
- Worker Nodes<br>

---

# Control Nodes

---

### Control Node
<!-- .slide: style="text-align: left;"> -->
<img src="images/control-node.gif" style="float: right"/>

---

### Control Node Components
<!-- .slide: style="text-align: left;"> -->
<img src="images/control-128.png" style="float: right"/>

Components for controlling the cluster: -<br>
- kube-apiserver<br>
- etcd<br>
- kube-scheduler<br>
- kube-controller-manager<br>
- cloud-controller-manager<br>

---

### The API Server
<!-- .slide: style="text-align: left;"> -->
<img src="images/api-128.png" style="float: right"/>

RESTful API endpoint: -
- The control plane front end
- Authentication and Authorisation
- Validates incoming requests
- Manages lifecycle of Kubernetes resources

---

### ETCD
<!-- .slide: style="text-align: left;"> -->
<img src="images/etcd-128.png" style="float: right"/>

A distibuted key value store: -
- A consistent cluster view
- Persist cluster state
- High availability and scalability
- Backup and restore

---

### Kube-Scheduler
<!-- .slide: style="text-align: left;"> -->
<img src="images/sched-128.png" style="float: right"/>

Selects nodes to run pods: -
- Evaluates nodes in cluster
- Implements scheduling policies
- Resource allocation
- Load Balancing

---

### kube-controller-manager
<!-- .slide: style="text-align: left;"> -->
<img src="images/c-m-128.png" style="float: right"/>

Runs the controller processes: -
- Node controller
- Namespace Controller
- Service Controller
- StatefulSet Controller

---

### Control Node High Availability
<!-- .slide: style="text-align: left;"> -->

Control Plane HA is a must!
- Multiple control nodes
- Load balancing across nodes
- Etcd cluster
- Managed K8s clusters

---

# Worker Nodes

---

### Worker Node Components
<!-- .slide: style="text-align: left;"> -->
<img src="images/node-128.png" style="float: right"/>

Running and maintaining pods<br>
- kubelet<br>
- kube-proxy<br>
- container runtime

---

### Kubelet
<!-- .slide: style="text-align: left;"> -->
<img src="images/kubelet-128.png" style="float: right"/>

Lifecycle management of pods: -
- Interacts with the container runtime
- Monitors node utilisation
- Containers are running and healthy

---

### Kube-proxy
<!-- .slide: style="text-align: left;"> -->
<img src="images/k-proxy-128.png" style="float: right"/>

Maintains network rules on nodes: -
- Communication between pods and services
- Service discovery
- Endpoint monitoring
- Uses IP tables (or IPVS)

---

### Container Runtime
<!-- .slide: style="text-align: left;"> -->
<img src="images/docker.png" style="float: right"/>

Interacts with the kubelet to: -
- Manage the lifecycle of containers
- Pull images from registry
- Provides isolation
- Used to be Docker

---

### Why no longer Docker?
<!-- .slide: style="text-align: left;"> -->
<img src="images/docker.png" style="float: right"/>

First container runtime used by Kubernetes: -
- Docker support hardcoded - dockershim
- Added support for other runtimes
- Implementation of the CRI
- No longer need to maintain dockershim

---

# Deploying Applications

---

### Daemonsets
<!-- .slide: style="text-align: left;"> -->

Runs a pod on every node in the cluster: -
- Log collection
- Monitoring
- Not really a use case for SQL Server!

---

### Deployments
<!-- .slide: style="text-align: left;"> -->

Declarative method to spin up applications: -
- Desired state in yaml file
- Self-healing
- Easy updates and rollbacks
- Typically for stateless apps

---

### Statefulsets
<!-- .slide: style="text-align: left;"> -->

Valuable for applications requiring: -
- Unique network identifiers
- Persistent storage
- Graceful deployment and scaling
- Ordered rolling updates

---

# Controlling high availability

---

### Pod Eviction Timings

<pre><code data-line-numbers="1-9|2-5|6-9">tolerations:
- key: "node.kubernetes.io/unreachable"
  operator: "Exists"
  effect: "NoExecute"
  tolerationSeconds: 10
- key: "node.kubernetes.io/not-ready"
  operator: "Exists"
  effect: "NoExecute"
  tolerationSeconds: 10
</pre></code>

---

### Persisting Data
<!-- .slide: style="text-align: left;"> -->

Three main concepts in Kubernetes: -
- Storage Classes
- Persistent Volumes
- Persistent Volume Claims

---

### Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/k8sdeepdive">https://github.com/dbafromthecold/k8sdeepdive</a><br>
</font>

<p align="center">
  <img src="images/k8sdeepdiveQr.jpg" />
</p>
