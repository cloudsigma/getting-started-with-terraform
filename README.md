# Getting Started with Terraform

This repo contains the sample code for the blog post series [How To Use Terraform with CloudSigma](https://insert-link-here).
The examples correspond to the following parts of the series:

> Note: The examples deploy resources into your CloudSigma account. It is not our responsibility if you are charged money for this.

1. [Getting started with Terraform](https://insert-link-here)
    - [single-web-server](./single-web-server): Deploy a single CloudSigma server with NGINX server that will return
      "Welcome to nginx!" page for every request on port 80.
2. [How to perform bulk operations](https://insert-link-here)
    - [bulk-drives-clone](./bulk-drives-clone): Clone multiple CloudSigma drives using `count` parameter.
    - [bulk-servers-create](./bulk-servers-create): Create multiple CloudSigma servers using `count` parameter.

## Quick start

1. Install Terraform.
2. Set your CloudSigma credentials in `terraform.tfvars` file.
3. Generate a new SSH key under your home directory (`demo` and `demo.pub`)
4. `cd` into one of the example folders.
5. Run `terraform init`.
6. Run `terraform apply`.
7. After it's done deploying, the example will output an IP you can try out.
8. To clean up and delete all resources after you're done, run `terraform destroy`.

## License

Please see [LICENSE](LICENSE) for details on how the code in this repo is licensed.
