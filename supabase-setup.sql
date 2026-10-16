-- Rode este script no Supabase: SQL Editor > New query > Run
create table if not exists public.despesas (
  id bigint generated always as identity primary key,
  item text not null,
  cat text not null,
  day int not null check (day between 1 and 31),
  eur numeric(10,2) not null default 0,
  created_at timestamptz default now()
);

alter table public.despesas enable row level security;

-- Quem tem o link do site pode ler, adicionar, editar e excluir
create policy "acesso_publico" on public.despesas
  for all to anon using (true) with check (true);

-- Atualizacao em tempo real
alter publication supabase_realtime add table public.despesas;

-- Despesas iniciais (55)
insert into public.despesas (item, cat, day, eur) values
  ('Doca', 'Hospedagem', 7, 455.4),
  ('Primark', 'Roupa', 11, 278.2),
  ('Fnac - Fone de ouvido', 'Eletrônicos', 8, 216.95),
  ('Sephora', 'Roupa', 8, 170.0),
  ('Almoço da ConfOA (04 almoços)', 'Alimento', 1, 155.6),
  ('Adidas', 'Roupa', 12, 140.6),
  ('Café da manhã - Catia Poliana', 'Alimento', 6, 105.0),
  ('Refeições na Disney', 'Alimento', 6, 96.9),
  ('Jantar no O Coreto Restaurante e Café', 'Alimento', 7, 80.7),
  ('Ferrari Pastelaria', 'Alimento', 12, 77.96),
  ('Hotel em Paris - Generator', 'Hospedagem', 5, 70.6),
  ('Fnac - JBL', 'Eletrônicos', 9, 69.99),
  ('Guilherme', 'Uber', 9, 67.0),
  ('Almoço no Ferreira Elvino', 'Alimento', 7, 55.0),
  ('Normal', 'Utilitário', 8, 54.6),
  ('Primor - Perfume Ricardo', 'Roupa', 9, 40.95),
  ('Aeropuerto Madrid Brajas', 'Alimento', 13, 39.9),
  ('Stimme Unipessoal', 'Outros', 12, 39.2),
  ('Papaya - café da manhã', 'Alimento', 10, 36.9),
  ('Papaya - café da manhã', 'Alimento', 8, 36.4),
  ('Uber (diversos deslocamentos)', 'Uber', 5, 34.87),
  ('Phoenix', 'Outros', 6, 33.7),
  ('Normal', 'Utilitário', 12, 32.5),
  ('McDonald''s', 'Alimento', 10, 31.15),
  ('Lefties', 'Outros', 12, 30.94),
  ('Uber (diversos deslocamentos)', 'Uber', 8, 29.88),
  ('Lebre Churrasqueira', 'Alimento', 12, 28.9),
  ('Sabores e Paladares', 'Alimento', 11, 26.65),
  ('Go to Lisboa - ônibus para Aeroporto', 'Uber', 13, 25.8),
  ('RATP (ida e volta Disneyland Paris)', 'Metrô', 6, 25.5),
  ('Manga Ramen', 'Alimento', 11, 25.45),
  ('Uber', 'Uber', 6, 20.94),
  ('Zoop - Chip de Gabriel', 'Utilitário', 3, 20.0),
  ('Bolt', 'Uber', 12, 18.92),
  ('World uty Free Group', 'Utilitário', 13, 18.9),
  ('Deslocamentos', 'Metrô', 11, 17.2),
  ('Uber para Outlet', 'Uber', 12, 16.43),
  ('Uber (diversos deslocamentos)', 'Uber', 9, 15.63),
  ('Metropolitano de Lisboa', 'Metrô', 12, 15.2),
  ('Viva Maria - Cafe & Restaurante', 'Alimento', 12, 15.2),
  ('Uber do Aeroporto para a Doca', 'Uber', 7, 11.94),
  ('McDonald''s', 'Alimento', 8, 11.6),
  ('Uber para o Aeroporto', 'Uber', 13, 11.47),
  ('Uber', 'Uber', 10, 10.99),
  ('RATP', 'Metrô', 7, 10.2),
  ('Toalhas Hotel Lisboa', 'Hospedagem', 11, 10.0),
  ('100 Montaditos', 'Alimento', 11, 9.9),
  ('Croasant de Clara - Brioche Dorée', 'Alimento', 5, 9.8),
  ('Normal', 'Alimento', 11, 9.2),
  ('Primor - pincel de Clara', 'Roupa', 9, 6.75),
  ('Claudio Francisco No - Pipoca e água', 'Alimento', 11, 6.0),
  ('Note Loule - Bracelete de bronze', 'Roupa', 8, 5.98),
  ('Primark', 'Roupa', 8, 3.55),
  ('Bebidas P3 Sul', 'Alimento', 12, 3.3),
  ('CTT Cabo Ruivo', 'Alimento', 13, 1.45);