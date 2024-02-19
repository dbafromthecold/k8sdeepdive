# A deep dive into Kubernetes

---

## Andrew Pruski

<img src="images/apruski.jpg" style="float: right"/>

### Field Solutions Architect
#### Microsoft Data Platform MVP
#### Docker Captain
#### VMware vLeader

<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

### Session Aim
<!-- .slide: style="text-align: left;"> -->

To dive into Kubernetes to explore the various components and options for deploying applications

---

### Node Types
<!-- .slide: style="text-align: left;"> -->

Two different types of Kubernetes nodes: -<br>
- Control Nodes<br>
- Worker Nodes<br>

---

# Control Nodes

---

<section>
    <iframe src="https://www.canva.com/design/DAF9QST5Wds/rkniW-zzBNmHcd7koUL9bQ/view" width="100%" height="100%"></iframe>
</section>

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

### KubeScheduler
<!-- .slide: style="text-align: left;"> -->
<img src="images/sched-128.png" style="float: right"/>

Selects nodes to run pods: -
- Evaluates nodes in cluster
- Implements scheduling policies
- Resource allocation
- Load Balancing

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
- Ensure that containers are running and healthy

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

# Deploying Applications

---

### Deployments
<!-- .slide: style="text-align: left;"> -->

TBD

---

### Statefulsets
<!-- .slide: style="text-align: left;"> -->

TBD

---

### Daemonsets
<!-- .slide: style="text-align: left;"> -->

TBD

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

TBD

---

### Resources
<!-- .slide: style="text-align: left;"> -->

TBD