package com.zero.springboot.constant.enums;


public final class CommonEnum {

    /** 不提供构造函数 */
    private CommonEnum() {

    }

    /**
     * 性别(0：男,1：女)
     * @author
     *
     */
    public enum Sex{
        MAN("男", "0"),
        WOMAN("女", "1");

        private String text;
        private String value;

        private Sex(String text,String value){
            this.text=text;
            this.value=value;
        }
    }

    public enum NumStr{
        MINUX_ONE("负一","-1"),
        Zero("零","0"),
        ONE("一","1"),
        TWO("二","2"),
        THREE("三","3"),
        FOUR("四","4"),
        FIVE("五","5"),
        SIX("六","6"),
        SEVEN("七","7"),
        EIGHT("八","8"),
        NINE("九","9"),
        TEN("十","10");

        private String text;
        private String value;

        private NumStr(String text,String value){
            this.text=text;
            this.value=value;
        }

    }

    public enum Num{
        MINUX_ONE("负一",-1),
        Zero("零",0),
        ONE("一",1),
        TWO("二",2),
        THREE("三",3),
        FOUR("四",4),
        FIVE("五",5),
        SIX("六",6),
        SEVEN("七",7),
        EIGHT("八",8),
        NINE("九",9),
        TEN("十",10);

        private String text;
        private Integer value;

        private Num(String text,Integer value){
            this.text=text;
            this.value=value;
        }

    }

}