# Relatório sobre TCL (Transaction Control Language) no MySQL

# 1. O que é TCL e sua importância em um banco de dados?

**Definição de TCL**

A **Transaction Control Language (TCL)** é um conjunto de *comandos SQL* utilizados para **gerenciar transações em um banco de dados relacional.** Esses comandos *permitem controlar a confirmação ou reversão de modificações feitas em uma transação*, garantindo a **consistência e a integridade** dos dados.

**Importância**

- **Garantia de integridade:** Permite que operações em múltiplas tabelas sejam tratadas como uma única unidade, assegurando que todas as alterações sejam aplicadas ou nenhuma.
- **Recuperação de erros:** Facilita a reversão de alterações em caso de falhas.
- **Interação com o modelo ACID:** Garante que as propriedades de atomicidade, consistência, isolamento e durabilidade sejam mantidas.

# Principais comandos da TCL

**1. COMMIT**

Confirma as *alterações realizadas em uma transação*, tornando-as **permanentes** no banco de dados.

- **Exemplo:** COMMIT;

**2. ROLLBACK**

Desfaz **todas as alterações** realizadas em uma transação até o **último ponto de salvamento** ou o **início da transação**.

- **Exemplo:** ROLLBACK;

**3. SAVEPOINT**

Cria **pontos intermediários** dentro de uma transação para *permitir que partes específicas sejam desfeitas sem afetar toda a transação*.

- **Exemplo:** SAVEPOINT nome_ponto;

**4. SET TRANSACTION**

Configura **características específicas** para a transação, como o *nível de isolamento.*

- **Exemplo:** SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

# 2. Transações no banco de dados

**O que é uma transação?**

Uma transação é uma **sequência de operações SQL que são tratadas como uma única unidade lógica.** Todas as operações devem ser *executadas integralmente*, caso contrário, nenhuma delas será aplicada.

**Como o MySQL lida com transações?**

- **Bem-sucedida:** As alterações são confirmadas com *COMMIT*.
- **Falha:** As alterações são revertidas com *ROLLBACK*.

**Garantindo a integridade dos dados**

As transações garantem que o banco de dados mantenha o estado consistente, mesmo diante de falhas, ao aplicar as propriedades ACID:

- **Atomicidade:** Todas as operações são realizadas ou nenhuma é.
- **Consistência:** O banco de dados muda de um estado consistente para outro.
- **Isolamento:** Transações paralelas não interferem umas nas outras.
- **Durabilidade:** Alterações confirmadas são persistentes.

# 3. Estudo de caso

**Exemplo prático**

Um sistema bancário que transfere fundos entre contas:

- **Operações envolvidas:**

  - Subtração do saldo da conta de origem.
  - Adição ao saldo da conta de destino.

- **Uso de transações:**

  - Garantir que ambas as operações sejam realizadas ou nenhuma delas ocorra.

# 4. Exemplo prático de código

*No arquivo SQL anexado no repositório.*

# 5. Conclusão

**Importância da TCL**

A TCL é **essencial para a integridade e consistência dos dados** em sistemas de banco de dados. Ela permite que as *operações sejam tratadas como unidades indivisíveis* e *facilita a recuperação* em cenários de falha.

**Vantagens das transações em sistemas críticos**

- **Integridade:** Garantia de que as operações ocorrem de forma completa e segura.
- **Recuperação de falhas:** Minimiza danos em caso de interrupções inesperadas.
- **Escalabilidade:** Fundamental em sistemas de grande porte, como bancos e e-commerces.
