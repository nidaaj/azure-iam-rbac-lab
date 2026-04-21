| Test User      | Group        | Action                          | Expected | Result |
| -------------- | ------------ | ------------------------------- | -------- | ------ |
| hr.user        | HR-Team      | View HR RG                      | Success  | Pass   |
| hr.user        | HR-Team      | Create storage account in HR RG | Fail     | Pass   |
| finance.user   | Finance-Team | Read finance blobs              | Success  | Pass   |
| finance.user   | Finance-Team | Restart VM                      | Fail     | Pass   |
| itsupport.user | IT-Support   | Restart VM                      | Success  | Pass   |
