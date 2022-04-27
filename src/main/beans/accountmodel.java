package beans;

public class accountmodel {

    int account_id;
    String password;
    String email;
    int type;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public accountmodel(int account_id, String password, String email, int type) {
        this.account_id = account_id;
        this.password = password;
        this.email = email;
        this.type = type;
    }

}