<%@ page import="les.ejc.Encontro" %>
<html>
  <head>
	  <title>Impressão de Encontros</title>
  </head>
  <body>
    <h1><p align="center">Equipes do Encontro ${encontroInstance}</p></h1>
    <h3>Coordenação Geral:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.coordenacao_geral.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.coordenacao_geral.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.coordenacao_geral.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.coordenacao_geral.toStringEncontreiros()}</li>
    <h3>J5:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.j5.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.j5.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.j5.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.j5.toStringEncontreiros()}</li>
    <h3>Coordenação de Círculos:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.coordenacao_de_circulos.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.coordenacao_de_circulos.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.coordenacao_de_circulos.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.coordenacao_de_circulos.toStringEncontreiros()}</li>
    <h3>Apresentadores:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.apresentadores.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.apresentadores.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.apresentadores.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.apresentadores.toStringEncontreiros()}</li>
    <h3>Bandinha:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.bandinha.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.bandinha.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.bandinha.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.bandinha.toStringEncontreiros()}</li>
    <h3>Boa Vontade:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.boa_vontade.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.boa_vontade.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.boa_vontade.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.boa_vontade.toStringEncontreiros()}</li>
    <h3>Cozinha:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.cozinha.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.cozinha.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.cozinha.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.cozinha.toStringEncontreiros()}</li>
    <h3>Liturgia e Vigília:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.liturgia_e_vigilia.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.liturgia_e_vigilia.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.liturgia_e_vigilia.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.liturgia_e_vigilia.toStringEncontreiros()}</li>
    <h3>Correio Interno:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.correio_interno.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.correio_interno.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.correio_interno.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.correio_interno.toStringEncontreiros()}</li>
    <h3>Recepção aos Palestrantes:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.recepcao_aos_palestrantes.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.recepcao_aos_palestrantes.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.recepcao_aos_palestrantes.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.recepcao_aos_palestrantes.toStringEncontreiros()}</li>
    <h3>Som e Iluminação:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.som_e_iluminacao.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.som_e_iluminacao.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.som_e_iluminacao.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.som_e_iluminacao.toStringEncontreiros()}</li>
    <h3>Compras:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.compras.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.compras.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.compras.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.compras.toStringEncontreiros()}</li>
    <h3>Secretaria:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.secretaria.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.secretaria.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.secretaria.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.secretaria.toStringEncontreiros()}</li>
    <h3>Trânsito e Sociodrama:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.transito_e_sociodrama.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.transito_e_sociodrama.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.transito_e_sociodrama.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.transito_e_sociodrama.toStringEncontreiros()}</li>
    <h3>Ordem e Limpeza:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.ordem_e_limpeza.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.ordem_e_limpeza.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.ordem_e_limpeza.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.ordem_e_limpeza.toStringEncontreiros()}</li>
    <h3>Mini Box:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.mini_box.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.mini_box.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.mini_box.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.mini_box.toStringEncontreiros()}</li>
    <h3>Lanchinho:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.lanchinho.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.lanchinho.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.lanchinho.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.lanchinho.toStringEncontreiros()}</li>
    <h3>Visitação e Externa:</h3>
        <li>Jovem Coordenador 1: ${encontroInstance.visitacao_e_externa.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.visitacao_e_externa.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.visitacao_e_externa.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.visitacao_e_externa.toStringEncontreiros()}</li>
  </body>
</html>
