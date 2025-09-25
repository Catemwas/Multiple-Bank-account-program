"""Multi-Account Banking Program"""

walker BankAccount {
    has account_id: str;
    has balance: int;
    has action: str;      # "deposit", "withdraw", "transfer"
    has amount: int;
    has target_id: str;   # used only for transfers

    can start with `root entry;
    can process with transaction entry;
}

node transaction {
    has updated_balance: int = 0;
}

# CLI run
with entry:__main__ {
    # Deposit into account A
    root spawn BankAccount("A", 1000, "deposit", 200, "");
    # Withdraw from account B
    root spawn BankAccount("B", 500, "withdraw", 100, "");
    # Transfer from A to B
    root spawn BankAccount("A", 1200, "transfer", 300, "B");
}

impl BankAccount.start {
    if not [root --> (`?transaction)] {
        next = root ++> transaction();
    } else {
        next = [root --> (`?transaction)];
    }
    visit next;
}

impl BankAccount.process {
    if [-->] {
        visit [-->];
    } else {
        print("Account:", self.account_id);
        print("Starting Balance:", self.balance);

        if self.action == "deposit" {
            here.updated_balance = self.balance + self.amount;
            print("Deposited:", self.amount);
            print("New Balance:", here.updated_balance);

        } elif self.action == "withdraw" {
            if self.amount <= self.balance {
                here.updated_balance = self.balance - self.amount;
                print("Withdrew:", self.amount);
                print("New Balance:", here.updated_balance);
            } else {
                print("Error: Insufficient funds!");
                here.updated_balance = self.balance;
            }

        } elif self.action == "transfer" {
            if self.amount <= self.balance {
                here.updated_balance = self.balance - self.amount;
                print("Transferred:", self.amount, "to Account", self.target_id);
                print("New Balance (", self.account_id, "):", here.updated_balance);

                # simulate target account receiving money
                print("Account", self.target_id, "receives:", self.amount);

            } else {
                print("Error: Insufficient funds for transfer!");
                here.updated_balance = self.balance;
            }

        } else {
            print("Invalid action!");
            here.updated_balance = self.balance;
        }

        disengage;
    }
}
