#!/usr/bin/env ash

set  -x

K8S_CONTROLLER_IP=`grep controller "${TF_VAR_tf_workspace}/terraform.output"  | awk '{print $3}'`
sed -i 's/K8S_CONTROLLER_IP/'${K8S_CONTROLLER_IP}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_CONTROLLER_HOSTNAME="longhorn-staging-tests-00"
sed -i 's/K8S_CONTROLLER_HOSTNAME/'${K8S_CONTROLLER_HOSTNAME}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_1_IP=`grep worker-1 "${TF_VAR_tf_workspace}/terraform.output"  | awk '{print $3}'`
sed -i 's/K8S_WORKER_1_IP/'${K8S_WORKER_1_IP}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_1_HOSTNAME="longhorn-staging-tests-01"
sed -i 's/K8S_WORKER_1_HOSTNAME/'${K8S_WORKER_1_HOSTNAME}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_2_IP=`grep worker-2 "${TF_VAR_tf_workspace}/terraform.output"  | awk '{print $3}'`
sed -i 's/K8S_WORKER_2_IP/'${K8S_WORKER_2_IP}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_2_HOSTNAME="longhorn-staging-tests-02"
sed -i 's/K8S_WORKER_2_HOSTNAME/'${K8S_WORKER_2_HOSTNAME}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_3_IP=`grep worker-3 "${TF_VAR_tf_workspace}/terraform.output"  | awk '{print $3}'`
sed -i 's/K8S_WORKER_3_IP/'${K8S_WORKER_3_IP}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

K8S_WORKER_3_HOSTNAME="longhorn-staging-tests-03"
sed -i 's/K8S_WORKER_3_HOSTNAME/'${K8S_WORKER_3_HOSTNAME}'/' "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"

rke up --config "${TF_VAR_tf_workspace}/templates/3-nodes-k8s.yml"
