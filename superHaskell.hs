-- Passo 1
type Codigo = Int
type Nome   = String
type Preco  = Int

type Produtos = [(Codigo, Nome, Preco)]

-- Passo 2
tabelaProdutos :: Produtos
tabelaProdutos = [ (001, "Chocolate", 121)
				 , (002, "Biscoito", 1010)
				 , (003, "Laranja", 56)
				 , (004, "Sabao", 21)
				 , (005, "Batata Chips", 133)
				 , (006, "Doritos", 450)]

-- Passo 3
type Carrinho = [Codigo]
type Conta = [(Nome,Preco)]

-- Passo 4
formataCentavos :: Preco -> String
formataCentavos preco = show a ++ "." ++ if p < 10 then "0" ++ show p else show p
    where a = preco `div` 100
          p = preco `mod` 100

-- Passo 5
tamanhoLinha :: Int
tamanhoLinha = 30

formataLinha :: (Nome, Preco) -> String
formataLinha (nome,preco) = nome 
                          ++ replicate (tamanhoLinha - length nome - length preco') '.' 
                          ++ preco'
                          ++ "\n"
    where preco' = formataCentavos preco

-- Passo 6
formataLinhas :: [(Nome, Preco)] -> String
formataLinhas [] = []
formataLinhas ((nome,preco):calda) = 
        let linha = formataLinha((nome,preco))
            resto  = formataLinhas(calda)
            in linha ++ resto

-- Passo 7
formataTotal :: Preco -> String
formataTotal preco = "\nTotal" 
                   ++ replicate (tamanhoLinha - 5 - length preco') '.'
                   ++ preco'
    where preco' = formataCentavos preco

-- Passo 8
formataConta :: Conta -> String
formataConta conta = "Comercial Haskell \n\n"
                   ++ formataLinhas conta
                   ++ formataTotal (calculoTotal conta)

-- Passo 9
calculoTotal :: Conta -> Preco
calculoTotal total = sum [p | (n, p) <- total]

-- Passo 10
procuraCodigo :: Produtos -> Codigo -> (Nome,Preco)
procuraCodigo prod cod = if resposta == []
	                     then ("Nao encontrado", 0)
	                     else head resposta
	where resposta = [(nome,preco) | (bn,nome,preco) <- prod, cod == bn]

-- Passo 11
criaConta :: Produtos -> Carrinho -> Conta
criaConta prod cesta = map (procuraCodigo prod) cesta 

-- Passo 12
fazCompra :: Produtos -> Carrinho -> IO ()
fazCompra prod cesta = putStrLn (formataConta (criaConta prod cesta))











