
# Migration estimator

I started this estimator because I wanted to formulate a rule to help decide when offload
cold migration is faster then offloaded warm migration. Here is the formula:

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


The question to ask here is what should be the      application change rate,
given the current speeds.
Here is an example:


Here 
oc new-project migration-estimator
oc new-build --binary --name=migration-estimator --strategy=docker
oc start-build migration-estimator --from-dir=. --follow
oc new-app migration-estimator
oc create route edge migration-estimator --service=migration-estimator --port=8080-tcp
 
