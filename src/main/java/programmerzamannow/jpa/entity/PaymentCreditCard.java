package programmerzamannow.jpa.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "payment_credit_card")
@Setter
@Getter
public class PaymentCreditCard extends Payment {

    @Column(name = "masked_card")
    private String maskedCard;

    @Column(name = "bank")
    private String bank;

}
