package beans;

public class balance {
    int user_id;
    float balance;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public balance(int user_id, float balance) {
        this.user_id = user_id;
        this.balance = balance;
    }

}
