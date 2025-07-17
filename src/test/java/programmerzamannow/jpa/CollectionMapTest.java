package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Member;
import programmerzamannow.jpa.entity.Name;
import programmerzamannow.jpa.util.JpaUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CollectionMapTest {

    @Test
    void create() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Member member = new Member();
        member.setName(new Name("Mr.", "Budi", "Yono", "Bakrie"));
        member.setEmail("b1n3m4@example.com");

        member.setSkills(new HashMap<String, Integer>());
        member.getSkills().put("HTML", 6);
        member.getSkills().put("CSS", 8);
        member.getSkills().put("NextJs", 9);

        entityManager.persist(member);
        entityTransaction.commit();

    }

    @Test
    void update() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Member member = entityManager.find(Member.class, 1);

        member.getHobbies().add("Reading");

        entityManager.merge(member);


        entityTransaction.commit();

    }
}
