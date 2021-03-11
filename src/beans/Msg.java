package beans;

import java.io.Serializable;

public class Msg implements Serializable {
    private String result;

    public Msg() {}

    public String getResult() {
        return result;
    }

    public Msg(String result) {
        this.result=result;
    }

}
