--横持ちデータを縦持ちデータに変換
--システムテーブルとcross joinしてコードを付加。
--変換前カラム：年月、製造数、不良品数、良品数
--変換後カラム：年月、数量コード（1：製造数、2：不良品数、3：良品数）、数量

select
  a.data_ym
  , case b.seq as qty_cd
  , case b.seq 
    when 1 then produced_qty
    when 2 then defective_qty
    when 3 then satisfactory_qty
    end as qty
from
  ( 
    select
      tg.data_ym
      , sum(tg.produced_qty) as produced_qty  --製造数
      , sum(tg.defective_qty) as defective_qty  --不良品数
      , sum(tg.satisfactory_qty) as satisfactory_qty  --良品数
    from
      dbo.t_good sam 
    where
      tg.data_ym between @data_ym_from and @data_ym_to
    group by
      tg.data_ym
  ) a 
  cross join ( 
    select
      top 3 row_number() over (order by a.object_id) as seq 
    from
      sys.all_columns a
  ) b