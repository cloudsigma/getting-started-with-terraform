# Getting Started with Terraform

This repo contains the sample code for the blog post [How To Use Terraform with CloudSigma](https://insert-link-here).

> Note: This example deploys resources into your CloudSigma account. It is not our responsibility if you are charged money for this.

## Quick start

1. Install Terraform.
2. Set your CloudSigma credentials in `terraform.tfvars` file.
3. Generate a new SSH key under your home directory (`demo` and `demo.pub`)
4. Run `terraform init`.
5. Run `terraform apply`.
6. After it's done deploying, the example will output an IP you can try out.
7. To clean up and delete all resources after you're done, run `terraform destroy`.

## License

Please see [LICENSE](LICENSE) for details on how the code in this repo is licensed.
