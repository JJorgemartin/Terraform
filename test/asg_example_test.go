package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAsgExample(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// You should update this relative path to point at your alb
		// example directory!
		TerraformDir: "../examples/asg",
		Vars: map[string]interface{}{
			"cluster_name": fmt.Sprintf("test-%s", random.UniqueId()),
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
