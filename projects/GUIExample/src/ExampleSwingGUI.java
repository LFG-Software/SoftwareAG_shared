import javax.swing.*;
import java.awt.*;

public class ExampleSwingGUI extends JFrame {

    public ExampleSwingGUI(String title) throws HeadlessException {
        super(title);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        setLocation(500, 340);

        JLabel sampleLabel = new JLabel("LABEL");
        JButton sexyButton = new JButton("Press me sexy senpai!");
        JButton evilButton = new JButton("Don't press me I'm evil!");

        add(sampleLabel);
        add(sexyButton);
        add(evilButton);

        pack();

        // actionListeners for the buttons
        sexyButton.addActionListener(event -> {
            JFrame frame = new JFrame("blub");
            frame.setLayout(new FlowLayout());
            JTextField textField = new JTextField(30);
            JButton popupButton = new JButton("POPUP");

            frame.add(textField);
            frame.add(popupButton);
            frame.pack();
            frame.setVisible(true);

            popupButton.addActionListener(e -> {
                JFrame popupFrame = new JFrame("popup window");
                JLabel label = new JLabel(textField.getText());

                popupFrame.add(label);

                popupFrame.pack();
                popupFrame.setVisible(true);
            });
        });

        evilButton.addActionListener(event -> {
            System.exit(1);
        });
        setVisible(true);
    }

    public static void main(String[] args) {
        ExampleSwingGUI exampleSwingGUI = new ExampleSwingGUI("Example Graphical User Interface");
    }
}
