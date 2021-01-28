--�������f�[�^���c�����f�[�^�ɕϊ�
--�V�X�e���e�[�u����cross join���ăR�[�h��t���B
--�ϊ��O�J�����F�N���A�������A�s�Ǖi���A�Ǖi��
--�ϊ���J�����F�N���A���ʃR�[�h�i1�F�������A2�F�s�Ǖi���A3�F�Ǖi���j�A����

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
      , sum(tg.produced_qty) as produced_qty  --������
      , sum(tg.defective_qty) as defective_qty  --�s�Ǖi��
      , sum(tg.satisfactory_qty) as satisfactory_qty  --�Ǖi��
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