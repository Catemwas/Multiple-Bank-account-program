"""Simple Calculator"""

walker CalcGame {
    has num1: int;
    has num2: int;
    has operation: str;

    can start with `root entry;
    can calculate with turn entry;
}

node turn {
    has result: float = 0.0;
}

# CLI run
with entry:__main__ {
    root spawn CalcGame(10, 5, "+");
    root spawn CalcGame(12, 3, "-");
    root spawn CalcGame(7, 8, "*");
    root spawn CalcGame(20, 4, "/");
}

impl CalcGame.start {
    if not [root --> (`?turn)] {
        next = root ++> turn();
    } else {
        next = [root --> (`?turn)];
    }
    visit next;
}

impl CalcGame.calculate {
    if [-->] {
        visit [-->];
    } else {
        if self.operation == "+" {
            here.result = self.num1 + self.num2;
        } elif self.operation == "-" {
            here.result = self.num1 - self.num2;
        } elif self.operation == "*" {
            here.result = self.num1 * self.num2;
        } elif self.operation == "/" {
            if self.num2 != 0 {
                here.result = self.num1 / self.num2;
            } else {
                print("Error: Division by zero!");
                disengage;
            }
        } else {
            print("Invalid operation!");
            disengage;
        }

        print(self.num1, self.operation, self.num2, "=", here.result);
        disengage;
    }
}
