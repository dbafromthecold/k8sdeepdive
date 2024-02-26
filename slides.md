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
<img src="images/down_the_rabbit_hole.gif" style="float: left; border: 20px solid rgba(0, 0, 0, 0);"/>
<br>
To dive into Kubernetes to explore the various components and options for deploying applications

---

### Node Types
<!-- .slide: style="text-align: left;"> -->

Two different types of Kubernetes nodes: -

<div style="display: flex; justify-content: center;">
  <div style="text-align: center;">
    <p>
      Control Nodes
    </p>
    <img src="images/control-128.png" />
  </div>
  <div style="width: 200px;"></div> <!-- Adjust the width to control the spacing -->
  <div style="text-align: center;">
    <p>
      Worker Nodes
    </p>
    <img src="images/node-128.png" />
  </div>
</div>

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

Managing the cluster: -
<ul>
  <li class="fragment">kube-apiserver</li>
  <li class="fragment">etcd</li>
  <li class="fragment">kube-scheduler</li>
  <li class="fragment">kube-controller-manager</li>
  <li class="fragment">cloud-controller-manager</li>
</ul>

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

Running applications: -
<ul>
  <li class="fragment">kubelet</li>
  <li class="fragment">kube-proxy</li>
  <li class="fragment">container runtime</li>
</ul>

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
<img src="images/cross_docker.png" style="float: left; border: 20px solid rgba(0, 0, 0, 0);"/>
<br>

- Docker support hardcoded
- Added support for other runtimes
- Implementation of the CRI
- Dockershim no longer needed

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

<div style="display: flex; justify-content: center;">
  <div style="text-align: center;">
    <p>
      Storage Class
    </p>
    <img src="images/sc-128.png" />
  </div>
  <div style="width: 200px;"></div>
  <div style="text-align: center;">
    <p>
      Persistent Volumes
    </p>
    <img src="images/pv-128.png" />
  </div>
  <div style="width: 200px;"></div>
  <div style="text-align: center;">
    <p>
      Persistent Volume Claims
    </p>
    <img src="images/pvc-128.png" />
  </div>
</div>


---

### Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/k8sdeepdive">https://github.com/dbafromthecold/k8sdeepdive</a><br>
</font>

<p align="center">
  <img src="images/k8sdeepdiveQr.jpg" />
</p>
