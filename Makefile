build-oc-image:
	oc start-build -n migration-estimator migration-estimator --from-dir=. --follow

rollout-latest-oc:
	oc rollout latest  -n migration-estimator migration-estimator


 
