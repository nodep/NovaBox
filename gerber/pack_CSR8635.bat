md order

copy /y NovaBox_8635-B.Cu.gbl        order\NovaBox_8635.GBL
copy /y NovaBox_8635-B.Mask.gbs      order\NovaBox_8635.GBS
copy /y NovaBox_8635-B.SilkS.gbo     order\NovaBox_8635.GBO
copy /y NovaBox_8635-Edge.Cuts.gm1   order\NovaBox_8635.GKO
copy /y NovaBox_8635-F.Cu.gtl        order\NovaBox_8635.GTL
copy /y NovaBox_8635-F.Mask.gts      order\NovaBox_8635.GTS
copy /y NovaBox_8635-F.SilkS.gto     order\NovaBox_8635.GTO
copy /y NovaBox_8635.drl             order\NovaBox_8635.TXT

cd order

7za a -tzip NovaBox_8635 *.*
