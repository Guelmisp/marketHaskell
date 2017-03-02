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
type Conta = [(Nome)]

-- Passo 4