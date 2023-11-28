-- Create database
CREATE database clinic;

CREATE TABLE invoices
(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(8, 2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    CONSTRAINT fk_medical_history
        FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items
(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(8, 2),
    quantity INT,
    total_price DECIMAL(8, 2),
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoice
        FOREIGN KEY (invoice_id)
        REFERENCES invoices(id),
    CONSTRAINT fk_treatment
        FOREIGN KEY (treatment_id)
        REFERENCES treatments(id),
    PRIMARY KEY (id)
);