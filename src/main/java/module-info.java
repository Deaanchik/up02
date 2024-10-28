module com.example.up02 {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.up02 to javafx.fxml;
    exports com.example.up02;
}