# **Subject:** RE: Deployment & User Access Cleanup Tasks

Hi Team,

As discussed, there are a few housekeeping items related to deployment scripts, user access, and file ownership that need your attention. Please take care of the following and make sure all changes meet our access and compliance requirements.

---
### **1. Deployment Script Access**
The engineers set up a deployment script for our service, but let’s just say it didn’t exactly meet standards. You’ll need to fix the access permissions.

- Ensure that **only** members of the `deployment` group are able to **run** `/opt/files/deploy.sh`.  
- Make sure the script is **group-owned** by `deployment` and verify that the correct permissions reflect this.

---
### **2. QA Group Creation**
We also need to establish a dedicated QA group, since we never actually set that up during onboarding.

- Create a new group named `qa`.  
- Add **john** and **martin** to that group.  
- Confirm that the group exists and that both users are members.

---
### **3. New Deployment User**
We’ve got a new intern joining the deployment effort:

- Create a new user account for **tim**.  
- Add **tim** to the `deployment` group so he has the same access privileges as the rest of the team.

---
### **4. Revoking Old Access**
Our former intern **jack** still has access, which needs to be revoked. I always thought there was something fishy about that guy, so I just want to make sure.

- Lock **jack’s** account so he can no longer log in.  
- His old files are located under `/opt/files/jack`.  
- Transfer ownership of those files to **tim**, but **keep the directory name as “jack.”**

---
### **5. Legal Hold Files**
Lastly, there’s a special case regarding our former VP.

- His data lives under `/opt/files/montgomery`.  
- Only the **legal** group should have **read access** to this directory.  
- No one — not even the owner — should have **write** privileges.  

---
Once you’ve completed everything, run your standard checks to make sure ownerships, permissions, and group memberships align with our policy. Our development team has graciously provided a script to check everything, it will be under **grade.sh** attached to this e-mail.

Let me know if you run into any access or verification issues.

Best,  
**Kevin G.**  
Systems Administration Lead
