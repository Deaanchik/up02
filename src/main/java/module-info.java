module com.example.kursachh {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires java.desktop;


    opens com.example.up02 to javafx.fxml;
    exports com.example.up02;
}