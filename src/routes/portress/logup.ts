import { Static, Type } from '@sinclair/typebox';
import { FastifyInstance } from 'fastify';
import {prismaClient} from '../../prisma';

// const GetPortressQuery = Type.Object({
// 	name: Type.Optional(Type.String())});
// type GetPortressQuery = Static<typeof GetPortressQuery>;

const portressWithoutId = Type.Object({
    name: Type.String(),
    email:Type.String({ format: 'email' }),
    phone:Type.String(),
    url:Type.String(),
    image: Type.String(),
    price: Type.String(),
});
type portressWithoutId = Static<typeof portressWithoutId>;
export default async function(app:FastifyInstance){
  app.route({
        method:'PUT',
        url:'/create',
        schema:{
            summary:'Create new photographer',
            tags:['Portress'],
            body:portressWithoutId
        },
        handler: async (request,reply) =>{
            const portress= request.body as portressWithoutId;
            await prismaClient.portress.create({
                data: portress
            })
        }
    });
}
