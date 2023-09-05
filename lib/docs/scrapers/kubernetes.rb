module Docs
  class Kubernetes < UrlScraper
    self.name = 'Kubernetes'
    self.slug = 'kubernetes'
    self.type = 'kubernetes'
    self.release = '1.23'
    self.base_url = 'https://kubernetes.io/docs/'

    self.root_path = 'home/'

    self.links = {
      home: 'https://kubernetes.io/',
      code: 'https://github.com/kubernetes/kubernetes'
    }

    html_filters.push 'kubernetes/clean_html', 'kubernetes/entries'

    options[:container] = ->(filter) {
      filter.root_page? ? '#mainContent' :
      filter.slug.include?('kubectl-commands') ? '#page-content-wrapper' :
      '.td-content'
    }


    options[:skip_patterns] = [
      /contribute/,
      /home/,
      /reference\/glossary/,
      /admin/,
      /user-guide/,
      /_print/,
      # /reference\/generated\/kubectl\/kubectl/,
      /reference\/generated\/kubectl\/kubectl-cmds/,
      /reference\/generated\/kubernetes-api/
    ]
    options[:replace_paths] = {
      'reference/access-authn-authz/authentication' => 'reference/access-authn-authz/authentication/',
      'reference/kubectl/jsonpath' => 'reference/kubectl/jsonpath/',
      'reference/generated/kube-apiserver/' => 'reference/command-line-tools-reference/kube-apiserver/',
      'reference/setup-tools/kubeadm/kubeadm' => 'reference/setup-tools/kubeadm/',
      'reference/setup-tools/kubeadm/kubeadm-alpha' => 'reference/setup-tools/kubeadm/kubeadm-alpha/',
      'reference/setup-tools/kubeadm/kubeadm-config' => 'reference/setup-tools/kubeadm/kubeadm-config/',
      'reference/setup-tools/kubeadm/kubeadm-init' => 'reference/setup-tools/kubeadm/kubeadm-init/',
      'reference/setup-tools/kubeadm/kubeadm-join' => 'reference/setup-tools/kubeadm/kubeadm-join/',
      'reference/setup-tools/kubeadm/kubeadm-reset' => 'reference/setup-tools/kubeadm/kubeadm-reset/',
      'reference/setup-tools/kubeadm/kubeadm-token' => 'reference/setup-tools/kubeadm/kubeadm-token/',
      'reference/setup-tools/kubeadm/kubeadm-upgrade' => 'reference/setup-tools/kubeadm/kubeadm-upgrade/',
      'reference/using-api/api-concepts' => 'reference/using-api/api-concepts/',
      'reference/access-authn-authz/admission-controllers' => 'reference/access-authn-authz/admission-controllers/',
      'reference/access-authn-authz/rbac' => 'reference/access-authn-authz/rbac/',
      'reference/command-line-tools-reference/feature-gates' => 'reference/command-line-tools-reference/feature-gates/',
      'reference/kubernetes-api/workload-resources/horizontal-pod-autoscaler-v1/' => 'reference/kubernetes-api/workload-resources/horizontal-pod-autoscaler-v2/',
      'reference/kubectl/overview' => 'reference/kubectl/overview/',
      'reference/scheduling/config' => 'reference/scheduling/config/',
      'reference/command-line-tools-reference/kubelet' => 'reference/command-line-tools-reference/kubelet/',
      'reference/generated/kubelet' => 'reference/command-line-tools-reference/kubelet/',

      'tasks/access-application-cluster/access-cluster' => 'tasks/access-application-cluster/access-cluster/',
      'tasks/configure-pod-container/assign-memory-resource' => 'tasks/configure-pod-container/assign-memory-resource/',
      'tasks/configure-pod-container/configure-pod-configmap' => 'tasks/configure-pod-container/configure-pod-configmap/',
      'tasks/access-application-cluster/configure-access-multiple-clusters' => 'tasks/access-application-cluster/configure-access-multiple-clusters/',
      'tasks/configure-pod-container/configure-runasusername' => 'tasks/configure-pod-container/configure-runasusername/',
      'tasks/configure-pod-container/create-hostprocess-pod' => 'tasks/configure-pod-container/create-hostprocess-pod/',
      'tasks/access-application-cluster/web-ui-dashboard' => 'tasks/access-application-cluster/web-ui-dashboard/',
      'tasks/configure-pod-container/enforce-standards-admission-controller' => 'tasks/configure-pod-container/enforce-standards-admission-controller/',
      'tasks/configure-pod-container/enforce-standards-namespace-labels' => 'tasks/configure-pod-container/enforce-standards-namespace-labels/',
      'tasks/inject-data-application/downward-api-volume-expose-pod-information' => 'tasks/inject-data-application/downward-api-volume-expose-pod-information/',
      'tasks/tools/install-kubectl-linux' => 'tasks/tools/install-kubectl-linux/',
      'tasks/tools/install-kubectl-macos' => 'tasks/tools/install-kubectl-macos/',
      'tasks/tools/install-kubectl-windows' => 'tasks/tools/install-kubectl-windows/',
      'tasks/configure-pod-container/migrate-from-psp' => 'tasks/configure-pod-container/migrate-from-psp/',
      'tasks/configure-pod-container/pull-image-private-registry' => 'tasks/configure-pod-container/pull-image-private-registry/',
      'tasks/access-application-cluster/ingress-minikube' => 'tasks/access-application-cluster/ingress-minikube/',
      'tasks/debug-application-cluster/debug-application' => 'tasks/debug-application-cluster/debug-application/',
      'tasks/debug-application-cluster/debug-cluster' => 'tasks/debug-application-cluster/debug-cluster/',
      'tasks/manage-kubernetes-objects/update-api-object-kubectl-patch' => 'tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/',
      'tasks/access-application-cluster/service-access-application-cluster' => 'tasks/access-application-cluster/service-access-application-cluster/',
      'tasks/network/validate-dual-stack' => 'tasks/network/validate-dual-stack/',
      'tasks/extend-kubernetes/custom-resources/custom-resource-definition-versioning' => 'tasks/extend-kubernetes/custom-resources/custom-resource-definition-versioning/',
      'tasks/access-kubernetes-api/custom-resources/custom-resource-definitions' => 'tasks/extend-kubernetes/custom-resources/custom-resource-definitions/',
      'tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/' => 'tasks/extend-kubernetes/custom-resources/custom-resource-definitions/',

      'tutorials/security/cluster-level-pss' => 'tutorials/security/cluster-level-pss/',
      'tutorials/security/ns-level-pss' => 'tutorials/security/ns-level-pss/',
      'tutorials/clusters/apparmor/' => 'tutorials/security/apparmor/',
      'tutorials/clusters/seccomp' => 'tutorials/security/seccomp/',
      'tutorials/clusters/seccomp/' => 'tutorials/security/seccomp/',
      'setup/production-environment/tools/kubeadm/kubelet-integration' => 'setup/production-environment/tools/kubeadm/kubelet-integration/',
      'setup/production-environment/container-runtimes' => 'setup/production-environment/container-runtimes/',
      'setup/best-practices/enforcing-pod-security-standards' => 'setup/best-practices/enforcing-pod-security-standards/',
      'setup/production-environment/tools/kubeadm/control-plane-flags' => 'setup/production-environment/tools/kubeadm/control-plane-flags/',
      'setup/production-environment/tools/kubeadm/install-kubeadm' => 'setup/production-environment/tools/kubeadm/install-kubeadm/',
      'setup/multiple-zones' => 'setup/best-practices/multiple-zones/',
      'concepts/overview/working-with-objects/annotations' => 'concepts/overview/working-with-objects/annotations/',
      'concepts/services-networking/connect-applications-service' => 'concepts/services-networking/connect-applications-service/',
      'concepts/containers/container-lifecycle-hooks' => 'concepts/containers/container-lifecycle-hooks/',
      'concepts/architecture/controller' => 'concepts/architecture/controller/',
      'concepts/security/controlling-access' => 'concepts/security/controlling-access/',
      'concepts/workloads/controllers/cron-jobs' => 'concepts/workloads/controllers/cron-jobs/',
      'concepts/workloads/controllers/daemonset' => 'concepts/workloads/controllers/daemonset/',
      'concepts/workloads/controllers/deployment' => 'concepts/workloads/controllers/deployment/',
      'concepts/containers/images' => 'concepts/containers/images/',
      'concepts/services-networking/ingress' => 'concepts/services-networking/ingress/',
      'concepts/services-networking/ingress-controllers' => 'concepts/services-networking/ingress-controllers/',
      'concepts/services-networking/dual-stack' => 'concepts/services-networking/dual-stack/',
      'concepts/overview/working-with-objects/object-management' => 'concepts/overview/working-with-objects/object-management/',
      'concepts/overview/working-with-objects/labels' => 'concepts/overview/working-with-objects/labels/',
      'concepts/overview/working-with-objects/namespaces' => 'concepts/overview/working-with-objects/namespaces/',
      'concepts/architecture/nodes/' => 'concepts/nodes/node/',
      'concepts/overview/working-with-objects/names' => 'concepts/overview/working-with-objects/names/',
      'concepts/storage/persistent-volumes' => 'concepts/storage/persistent-volumes/',
      'concepts/workloads/pods/pod-lifecycle' => 'concepts/workloads/pods/pod-lifecycle/',
      'concepts/scheduling-eviction/pod-priority-preemption' => 'concepts/scheduling-eviction/pod-priority-preemption/',
      'concepts/security/pod-security-admission' => 'concepts/security/pod-security-admission/',
      'concepts/security/pod-security-standards' => 'concepts/security/pod-security-standards/',
      'concepts/workloads/pods' => 'concepts/workloads/pods/',
      'concepts/workloads/controllers/replicationcontroller' => 'concepts/workloads/controllers/replicationcontroller/',
      'concepts/containers/runtime-class' => 'concepts/containers/runtime-class/',
      'concepts/scheduling-eviction/scheduling-framework' => 'concepts/scheduling-eviction/scheduling-framework/',
      'concepts/configuration/secret' => 'concepts/configuration/secret/',
      'concepts/storage/storage-classes' => 'concepts/storage/storage-classes/',
      'concepts/scheduling-eviction/taint-and-toleration' => 'concepts/scheduling-eviction/taint-and-toleration/',
      'concepts/services-networking/topology-aware-hints' => 'concepts/services-networking/topology-aware-hints/',
      'concepts/overview/working-with-objects/kubernetes-objects' => 'concepts/overview/working-with-objects/kubernetes-objects/',
      'concepts/storage/volumes' => 'concepts/storage/volumes/',
      'concepts/configuration/assign-pod-node/' => 'concepts/scheduling-eviction/assign-pod-node/',
      'concepts/scheduling-eviction/assign-pod-node' => 'concepts/scheduling-eviction/assign-pod-node/',
      'concepts/architecture/garbage-collection' => 'concepts/architecture/garbage-collection/',
      'concepts/workloads/controllers/garbage-collection/' => 'concepts/architecture/garbage-collection/',
      'concepts/workloads/controllers/job' => 'concepts/workloads/controllers/job/',
      'concepts/workloads/controllers/jobs-run-to-completion/' => 'concepts/workloads/controllers/job/',

      'reference/generated/kubectl/kubectl/' => 'reference/generated/kubectl/kubectl-commands/',
      'reference/kubectl/kubectl-cmds/' => 'reference/generated/kubectl/kubectl-commands/',
      'reference/generated/kubectl/kubectl-commands' => 'reference/generated/kubectl/kubectl-commands/',
    }

    options[:attribution] = <<-HTML
      &copy; 2022 The Kubernetes Authors<br>
      Documentation Distributed under CC BY 4.0.
    HTML

    # latest version has a special URL that does not include the version identifier
    version do
      self.release = "1.26"
      self.base_url = "https://kubernetes.io/docs/reference/kubernetes-api/"
    end

    version '1.20' do
      self.release = "#{version}"
      self.base_url = "https://v#{version.sub('.', '-')}.docs.kubernetes.io/docs/reference/kubernetes-api/"
    end

    def get_latest_version(opts)
      doc = fetch_doc('https://kubernetes.io/releases/', opts)
      doc.at_css('.td-content > h3:first-child').content
    end
  end
end
