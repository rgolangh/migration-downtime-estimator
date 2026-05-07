
# Migration Downtime Estimator

https://rgolangh.github.io/migration-downtime-estimator/

A small calculator to formulate a rule to help decide when offload
cold migration is faster then offloaded warm migration or rather which methods
results a smaller downtime.

The formula:

Wx (xcopy wtite speed) = 1G/s
Wv (vddk write speed) = 0.125 G/s
Wa (application i/o change rate) = ?

D (Initial Disk Size in Gb) 
D^ (Delta copy size in Gb)
t^ (seconds from last snapshot)
D^ = Wa *  t^

t1: offload copy time of a disk  
t1 = D / Wx
t4 = D^ / Wv = (Wa * t^) / Wv

Cold migration is better when:
D/Wx < (Wa * t^)/Wv
Wa > Wv * D / Wx * t^


The question to ask here is what should be the application change rate,
given the current speeds.
Here is an example:

# Run locally:
Open the local index.html

# Deploy to OpenShift from git:
oc new-project migration-downtime-estimator
oc new-build --binary --name=migration-downtime-estimator --strategy=docker
oc start-build migration-downtime-estimator --from-dir=. --follow
oc new-app migration-downtime-estimator
oc create route edge migration-downtime-estimator --service=migration-estimator --port=8080-tcp
 
