oc new-project migration-estimator
oc new-build --binary --name=migration-estimator --strategy=docker
oc start-build migration-estimator --from-dir=. --follow
oc new-app migration-estimator
oc expose svc/migration-estimator 
 
