package test

import(

	"fmt"
	"github.com/stretchr/testify/require"

	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
	"time"

)

func TestAlbExample(t *testing.T){
	opts := &terraform.Options{
		
		TerraformDir : "../examples/alb",

		Vars: map[string]interface{}{
			"alb_name": fmt.Sprintln("test-%s", random.UniqueId())
		}
	}
}