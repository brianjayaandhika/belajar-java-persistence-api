package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Customer;
import programmerzamannow.jpa.entity.CustomerType;
import programmerzamannow.jpa.util.JpaUtil;

public class EnumTest {

    @Test
    void enumTest() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Customer customer = new Customer();
        customer.setId("4");
        customer.setName("Steven");
        customer.setPrimaryEmail("steven_1123@example.com");
        customer.setMarried(false);
        customer.setAge((byte) 34);
        customer.setType(CustomerType.PREMIUM);

        entityManager.persist(customer);
        entityTransaction.commit();

    }
}
