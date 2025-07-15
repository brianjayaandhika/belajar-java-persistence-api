package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Image;
import programmerzamannow.jpa.util.JpaUtil;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ImageTest {

    @Test
    void image() throws IOException, URISyntaxException {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Image image = new Image();
        image.setName("Contoh Image");
        image.setDescription("Contoh Deskripsi Image");

        URL url = getClass().getResource("/images/sample.png");
        if (url == null) {
            throw new FileNotFoundException("File not found: /images/sample.png");
        }
        Path path = Paths.get(url.toURI());
        byte[] bytes = Files.readAllBytes(path);


        image.setImage(bytes);

        entityManager.persist(image);
        entityTransaction.commit();

        entityManagerFactory.close();
    }
}
