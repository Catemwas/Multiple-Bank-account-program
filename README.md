# Multiple Bank Account Program
## 📌Description
This is a simple banking simulation written in Jac.
It supports deposits, withdrawals, and transfers between accounts.`This code can seamlessly scale to cloud deployment without modification. By running the command, the walkers become API endpoints that can be called via HTTP requests. This shows how Jac applications are inherently cloud-ready.

## 🚀Features

✅Create multiple accounts with unique IDs

✅Deposit money into accounts

✅Withdraw money with balance check

✅Transfer funds between accounts

✅Prevents overdraft (insufficient funds check)

## 🪛Installation
1.Install Python3.12 or higher

2.Set up a virtual environment:
```
python -m venv jac-env
source jac-env/bin/activate   # Linux/Mac
jac-env\Scripts\activate      # Windows
```

3.Install Jac:
```
pip install jaclang
```

## ▶️Running the program
```
jac run bank_program.jac
```
## 📊Example Output
```
Account: A
Starting Balance: 1000
Deposited: 200
New Balance: 1200

Account: B
Starting Balance: 500
Withdrew: 100
New Balance: 400

Account: A
Starting Balance: 1200
Transferred: 300 to Account B
New Balance ( A ): 900
Account B receives: 300
```
## 🎊Contributors
[Catherine Njeri](https://github.com/Catemwas/Multiple-Bank-account-program)


