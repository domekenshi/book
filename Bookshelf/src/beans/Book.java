package beans;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable {
    // 1冊の本の情報を格納するJavaBeansクラス
    // フィールド
    private String isbn;// ISBNコード
    private String title;// タイトル
    private String authors;// 作者
    private String publisher;// 出版社
    private int price;// 価格
    private int evaluation;// 評価
    private int progress;// 読書の進行状況
    private Date getDate;// 入手日
    private Date publishDate;// 出版日
    private String memo;// メモ
    private String imgURL;// 書影のURL

    public Book() {
    }// カラのコンストラクタ

    public Book(String isbn, String title, String authors, String publisher, int price, int evaluation, int progress,
            Date getDate, Date publishDate, String memo, String imgURL) {
        this.isbn = isbn;
        this.title = title;
        this.authors = authors;
        this.publisher = publisher;
        this.price = price;
        this.evaluation = evaluation;
        this.progress = progress;
        this.getDate = getDate;
        this.publishDate = publishDate;
        this.memo = memo;
        this.imgURL = imgURL;
    }

    public Book(String isbn, String title, String authors, String publisher, String price, String evaluation,
            String progress, String getDate, String publishDate, String memo, String imgURL) {
        this.isbn = isbn;
        this.title = title;
        this.authors = authors;
        this.publisher = publisher;
        this.memo = memo;
        this.imgURL = imgURL;

        if (price != null) {
            if (price.length() != 0) {
                this.price = Integer.parseInt(price);
            }
        }

        System.out.println("evaluation");
        System.out.println(evaluation);

        if (evaluation != null) {
            if (evaluation.length() != 0) {
                this.evaluation = Integer.parseInt(evaluation);
            }
        }

        if (progress != null) {
            if (progress.length() != 0) {
                this.progress = Integer.parseInt(progress);
            }
        }

        if (getDate != null) {
            if (getDate.length() != 0) {
                this.getDate = Date.valueOf(getDate);
            }
        }

        // 手入力なのでエラーの恐れあり。正規表現なりなんなりの対策が必要
        if (publishDate != null) {
            if (publishDate.length() != 0) {
                this.publishDate = Date.valueOf(publishDate);
            }
        }
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(int evaluation) {
        this.evaluation = evaluation;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate(Date getDate) {
        this.getDate = getDate;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }
}
