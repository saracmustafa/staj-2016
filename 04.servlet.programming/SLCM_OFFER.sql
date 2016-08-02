CREATE TABLE SLCM_OFFER
(
  OFFER_ID NUMBER(12) PRIMARY KEY NOT NULL,
  OFFER_NAME VARCHAR2(100) NOT NULL,
  DESCRIPTION VARCHAR2(500),
  BILLCYCLE_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  EXTERNAL_OFFER_ID VARCHAR2(20) NOT NULL,
  DEFAULT_CAMPAIGN NUMBER(12) NOT NULL,
  COUNT_CONTROL NUMBER(5),
  CHARGING_RENEWAL_PROVISIONING NUMBER(1) DEFAULT 0 NOT NULL,
  PROVISIONING_OPTION NUMBER(2) DEFAULT 0 NOT NULL,
  TAKEOVER_BEHAVIOUR NUMBER(2) DEFAULT 1 NOT NULL,
  INFO NUMBER(1) DEFAULT 0 NOT NULL,
  ENTERTAINMENT NUMBER(1) DEFAULT 0 NOT NULL,
  STATUS NUMBER(2) DEFAULT 1 NOT NULL,
  START_DATE DATE NOT NULL,
  END_DATE DATE,
  STRICT_END_DATE DATE,
  END_DATE_THRESHOLD NUMBER(5) DEFAULT 0 NOT NULL,
  CREATION_DATE TIMESTAMP(6) NOT NULL,
  MODIFICATION_DATE TIMESTAMP(6) NOT NULL,
  VERSION NUMBER(12) DEFAULT 0 NOT NULL,
  POSTPAID_TO_PREPAID_BEHAVIOUR NUMBER(2) DEFAULT 0 NOT NULL,
  PREPAID_TO_POSTPAID_BEHAVIOUR NUMBER(2) DEFAULT 0 NOT NULL,
  RECURRING_SPLIT_OPTION NUMBER(1) DEFAULT 1 NOT NULL,
  BINDING NUMBER(1) DEFAULT 0 NOT NULL,
  TYPE NUMBER(2) DEFAULT 0 NOT NULL,
  PRIORITY NUMBER(2) DEFAULT 0 NOT NULL,
  QUOTA_BASED NUMBER(*) DEFAULT 0,
  BILLCYCLE_BEHAVIOUR NUMBER(2),
  BC_BASED_MIGRATION_DATE TIMESTAMP(6),
  PORTIN_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  DEDICATED_ACCOUNT_ID NUMBER(12),
  SERVICE_BOOSTER_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  IVR_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  PREP_PARTIAL_CHARGING_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  CHARGING_VALIDATION_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  COMMUNICATION_NO_ENABLED NUMBER(1) DEFAULT 0 NOT NULL,
  CALL_CREATE_ORDER NUMBER(1) DEFAULT 0 NOT NULL,
  CALL_LIFECYCLE_UPDATE NUMBER(1) DEFAULT 1 NOT NULL,
  CONSTRAINT FK_OFFER_RF_CAMPAIGN FOREIGN KEY (DEFAULT_CAMPAIGN) REFERENCES SLCM_CAMPAIGN (CAMPAIGN_ID)
);
COMMENT ON COLUMN SLCM_OFFER.BILLCYCLE_ENABLED IS 'true / false';
COMMENT ON COLUMN SLCM_OFFER.PROVISIONING_OPTION IS '1 : SO only';
COMMENT ON COLUMN SLCM_OFFER.TAKEOVER_BEHAVIOUR IS '1 : Terminate   2 : Move';
COMMENT ON COLUMN SLCM_OFFER.STATUS IS '0 : new  1 : active  2 : suspended  3 : terminated';
COMMENT ON COLUMN SLCM_OFFER.POSTPAID_TO_PREPAID_BEHAVIOUR IS 'Behaviour on payment method change from Postpaid To Prepaid (0:Keep, 1:Terminate)';
COMMENT ON COLUMN SLCM_OFFER.PREPAID_TO_POSTPAID_BEHAVIOUR IS 'Behaviour on payment method change from Prepaid To Postpaid (0:Keep, 1:Terminate)';
COMMENT ON COLUMN SLCM_OFFER.RECURRING_SPLIT_OPTION IS 'This option in offer will specify how SLCM must handle non-recurring over recurring subscription scenarios. There will be two values which will specify SLCM behavior: 1- Immediate and 2-Next Charging Date.';
COMMENT ON COLUMN SLCM_OFFER.TYPE IS 'This property specifies whether offer is a Real offer or a Virtual offer. 0 : Real, 1 : Virtual';
COMMENT ON COLUMN SLCM_OFFER.PRIORITY IS 'Charging priority, ENE sends refill notifications based on this priority';
COMMENT ON COLUMN SLCM_OFFER.QUOTA_BASED IS '
    0:NOT_QUOTA_BASED
    1:QUOTA_BASED_DATA_SES_SMS,
    2:QUOTA_BASED_OTHER
';
COMMENT ON COLUMN SLCM_OFFER.BILLCYCLE_BEHAVIOUR IS '
0:STANDARD,
1:BILLING_QUEUE_BASED,
2:BILLCYCLE_BASED_WITHOUT_PRORATING,
3:BILLCYCLE_BASED_WITH_PRORATING,
4:NONE_BC_BASED_WITHOUT_PRORATE ,

';
COMMENT ON COLUMN SLCM_OFFER.IVR_ENABLED IS '0:No IVR Notification, 1:Internally IVR Enabled, 2:Externally IVR Enabled';
COMMENT ON COLUMN SLCM_OFFER.COMMUNICATION_NO_ENABLED IS '
0:FALSE,
1:TRUE.
If true, notifications are sent to communication number provided by a webservice';
COMMENT ON COLUMN SLCM_OFFER.CALL_CREATE_ORDER IS '0:FALSE, 1:TRUE. Default false. If true, lifecycleUpdate service will be called instead of F37';
COMMENT ON COLUMN SLCM_OFFER.CALL_LIFECYCLE_UPDATE IS '0:FALSE, 1:TRUE. Default false. If true, lifecycleUpdate service will be called instead of F37';
CREATE UNIQUE INDEX AK_OFFER ON SLCM_OFFER (EXTERNAL_OFFER_ID);
CREATE UNIQUE INDEX FK_OFFER_RF_CAMPAIGN_FK ON SLCM_OFFER (DEFAULT_CAMPAIGN, OFFER_ID);
CREATE UNIQUE INDEX AK_OFFER_DEDICATED_ACC ON SLCM_OFFER (DEDICATED_ACCOUNT_ID);