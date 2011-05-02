<%@ page import="les.ejc.Encontro" %>
<html>
  <head>
	  <title>Impressão de Encontros</title>
  </head>

  <body>
    <h1><p align="center">Encontro Paróquia São Cristóvão</p></h1>
    <h2>Data: <g:formatDate date="${encontroInstance?.data} format="dd/MM/yyyy" /></h2>
    <h2>Dirigente Espiritual: ${encontroInstance.dirigenteEspiritual.nomeCompleto}</h2>
    <h2>Tema: ${encontroInstance.tema}</h3>
    <h2>Local: ${encontroInstance.local}</h3>
    <br>
    <h2>Círculo(s):</h3>
    <g:each in="${encontroInstance.circulos}" status="i" var="eventoInstance">
        <h3>${eventoInstance.nomeCirculo}</h3>
        <li>Cor: ${eventoInstance.cor}</li>
        <li>Jovem Coordenador: ${eventoInstance.jovemCoordenador.nomeCompleto} </li>
        <li>Casal Apoio: ${eventoInstance.casalApoio.nomeCompleto}</li>
    </g:each>
    <br>
    <h2>Equipes de Trabalho:</h2>
    <h3>Coordenação Geral:</h3>
        <li>Nome da Equipe: ${encontroInstance.coordenacao_geral.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.coordenacao_geral.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.coordenacao_geral.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.coordenacao_geral.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.coordenacao_geral.encontreiros}</li>
    <h3>J5:</h3>
        <li>Nome da Equipe: ${encontroInstance.j5.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.j5.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.j5.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.j5.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.j5.encontreiros}</li>
    <h3>Coordenação de Círculos:</h3>
        <li>Nome da Equipe: ${encontroInstance.coordenacao_de_circulos.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.coordenacao_de_circulos.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.coordenacao_de_circulos.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.coordenacao_de_circulos.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.coordenacao_de_circulos.encontreiros}</li>
    <h3>Apresentadores:</h3>
        <li>Nome da Equipe: ${encontroInstance.apresentadores.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.apresentadores.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.apresentadores.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.apresentadores.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.apresentadores.encontreiros}</li>
    <h3>Bandinha:</h3>
        <li>Nome da Equipe: ${encontroInstance.bandinha.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.bandinha.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.bandinha.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.bandinha.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.bandinha.encontreiros}</li>
    <h3>Boa Vontade:</h3>
        <li>Nome da Equipe: ${encontroInstance.boa_vontade.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.boa_vontade.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.boa_vontade.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.boa_vontade.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.boa_vontade.encontreiros}</li>
    <h3>Cozinha:</h3>
        <li>Nome da Equipe: ${encontroInstance.cozinha.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.cozinha.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.cozinha.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.cozinha.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.cozinha.encontreiros}</li>
    <h3>Liturgia e Vigília:</h3>
        <li>Nome da Equipe: ${encontroInstance.liturgia_e_vigilia.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.liturgia_e_vigilia.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.liturgia_e_vigilia.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.liturgia_e_vigilia.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.liturgia_e_vigilia.encontreiros}</li>
    <h3>Correio Interno:</h3>
        <li>Nome da Equipe: ${encontroInstance.correio_interno.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.correio_interno.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.correio_interno.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.correio_interno.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.correio_interno.encontreiros}</li>
    <h3>Recepção aos Palestrantes:</h3>
        <li>Nome da Equipe: ${encontroInstance.recepcao_aos_palestrantes.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.recepcao_aos_palestrantes.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.recepcao_aos_palestrantes.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.recepcao_aos_palestrantes.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.recepcao_aos_palestrantes.encontreiros}</li>
    <h3>Som e Iluminação:</h3>
        <li>Nome da Equipe: ${encontroInstance.som_e_iluminacao.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.som_e_iluminacao.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.som_e_iluminacao.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.som_e_iluminacao.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.som_e_iluminacao.encontreiros}</li>
    <h3>Compras:</h3>
        <li>Nome da Equipe: ${encontroInstance.compras.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.compras.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.compras.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.compras.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.compras.encontreiros}</li>
    <h3>Secretaria:</h3>
        <li>Nome da Equipe: ${encontroInstance.secretaria.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.secretaria.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.secretaria.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.secretaria.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.secretaria.encontreiros}</li>
    <h3>Trânsito e Sociodrama:</h3>
        <li>Nome da Equipe: ${encontroInstance.transito_e_sociodrama.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.transito_e_sociodrama.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.transito_e_sociodrama.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.transito_e_sociodrama.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.transito_e_sociodrama.encontreiros}</li>
    <h3>Ordem e Limpeza:</h3>
        <li>Nome da Equipe: ${encontroInstance.ordem_e_limpeza.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.ordem_e_limpeza.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.ordem_e_limpeza.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.ordem_e_limpeza.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.ordem_e_limpeza.encontreiros}</li>
    <h3>Mini Box:</h3>
        <li>Nome da Equipe: ${encontroInstance.mini_box.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.mini_box.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.mini_box.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.mini_box.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.mini_box.encontreiros}</li>
    <h3>Lanchinho:</h3>
        <li>Nome da Equipe: ${encontroInstance.lanchinho.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.lanchinho.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.lanchinho.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.lanchinho.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.lanchinho.encontreiros}</li>
    <h3>Visitação e Externa:</h3>
        <li>Nome da Equipe: ${encontroInstance.visitacao_e_externa.nomeEquipe}</li>
        <li>Jovem Coordenador 1: ${encontroInstance.visitacao_e_externa.jovemCoordenador1}</li>
        <li>Jovem Coordenador 2: ${encontroInstance.visitacao_e_externa.jovemCoordenador2}</li>
        <li>Casal Coordenador: ${encontroInstance.visitacao_e_externa.casalCoordenador}</li>
        <li>Encontreiros: ${encontroInstance.visitacao_e_externa.encontreiros}</li>
  </body>
</html>
