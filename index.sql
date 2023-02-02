create index product_id on product_mst(product_code); -- product_id를 PK로 잡기

show index from product_mst; -- product_mst 테이블 인덱스 출력

alter table product_mst
add unique product_name(product_name);

alter table product_mst
drop index product_id1;