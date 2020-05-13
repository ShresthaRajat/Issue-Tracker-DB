ALTER TABLE ticket_artefacts
    ADD CONSTRAINT ticket_artefacts_atrefacts_fk FOREIGN KEY ( atrefacts_artefact_id )
        REFERENCES atrefacts ( artefact_id );