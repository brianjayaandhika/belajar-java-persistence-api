package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Customer;
import programmerzamannow.jpa.entity.Member;
import programmerzamannow.jpa.entity.Name;
import programmerzamannow.jpa.util.JpaUtil;

public class EmbeddedTest {

    @Test
    void embedded() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Member member = new Member();

        member.setEmail("example-1@email.com");

        Name name = new Name();

        name.setTitle("Mr.");
        name.setFirstName("Eko");
        name.setMiddleName("Budiarty");
        name.setLastName("Khannedy");

        member.setName(name);

        entityManager.persist(member);
        entityTransaction.commit();

    }

    @Test
    void embedded2() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Member member = new Member();

        member.setEmail("example-1@email.com");

        member.setName(new Name("Mr.", "Toha", "Ahmad", "Baihaqi"));

        entityManager.persist(member);
        entityTransaction.commit();

    }

}
