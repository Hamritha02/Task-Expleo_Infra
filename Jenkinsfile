pipeline {
agent any
tools {
  terraform 'Terraform'
}
options { ansiColor('xterm') } 
 stages { 
   stage ('Checkout Repo') { 
     steps { 
       cleanWs()
       sh  'git clone https://github.com/Hamritha02/Task-Expleo.git'
      }
      } 

stage ('Terraform version') { 
  steps {
   sh '''
    terraform --version
   ''' 
    }
    }
    
  stage ('Terraform init') { 
  steps {
   sh '''
   cd Terraform-test/
   terraform init
   ''' 
   }
   }
   
  stage ('Terraform plan') { 
  steps {
   sh '''
   cd Terraform-test/
   terraform plan -out=tfplan.out
   terraform show -json tfplan.out
   ''' 
   }
   }
   
 stage ('Terraform apply') { 
  steps {
   sh '''
   cd Terraform-test/
   terraform apply --auto-approve
   ''' 
   }
        post { 
        always { 
            cleanWs()
         }
        }
       }
  }
}
