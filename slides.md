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

## Session Aim
<!-- .slide: style="text-align: left;"> -->
To dive into Kubernetes


---

### Node Types
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Control Nodes

---

### Control Node Components
<img src="images/control-128.png" style="float: right"/>

Components for controlling the cluster<br>
- kube-apiserver<br>
- etcd<br>
- kube-scheduler<br>
- kube-controller-manager<br>
- cloud-controller-manager<br>

---

### The API Server
<!-- .slide: style="text-align: left;"> -->
TBD

---

## ETCD
<!-- .slide: style="text-align: left;"> -->
TBD

---

### KubeScheduler
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Worker Nodes

---

### Worker Node Components
<!-- .slide: style="text-align: left;"> -->
<img src="images/node-128.png" style="float: right"/>

Running and maintaining pods<br>

- kubelet<br>
- kube-proxy<br>
- Container runtime

---

### Kubelet
<!-- .slide: style="text-align: left;"> -->

TBD

---

### Container Runtime
<!-- .slide: style="text-align: left;"> -->

TBD

---

## Deploying Applications

---

### Deployments
<!-- .slide: style="text-align: left;"> -->

TBD

---

### Statefulsets
<!-- .slide: style="text-align: left;"> -->

TBD

---

## Daemonsets
<!-- .slide: style="text-align: left;"> -->

TBD

---

## Controlling high availability

---

### Pod Eviction Timings
<!-- .slide: style="text-align: left;"> -->

<pre><code>
tolerations:
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

## Resources
<!-- .slide: style="text-align: left;"> -->

TBD